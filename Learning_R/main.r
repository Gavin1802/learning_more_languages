# Function: load_data
# This function loads student data from a CSV file or uses built-in sample data.
# It takes a boolean argument `use_csv` to determine the source of data.
# If `use_csv` is TRUE, it attempts to read from "grades.csv".
# If the file does not exist, it uses built-in sample data.
load_data <- function(use_csv = FALSE, file_path = "grades.csv") {
  if (use_csv && file.exists(file_path)) {
    df <- read.csv(file_path, stringsAsFactors = FALSE)
    cat("Loaded", nrow(df), "students from", file_path, "\n")

    # Add ID column to data in CSV if it doesn't exist
    if (!"ID" %in% names(df)) {
      df$ID <- as.integer(seq_len(nrow(df)))
    }

  } else {
    cat("Using built-in sample data: \n")
    df <- data.frame(
      ID = as.integer(1:5),
      Name = c("Alice", "Bob", "Carol", "David", "Eve"),
      Score = c(87, 65, 92, 45, 78),
    )
  }
  return(df)
}

# Function: grade_students
# This function assigns letter grades based on the scores in the data frame.
# It also determines if each student has passed, meaning their score >= 60.
grade_students <- function(df) {
  grades <- character(nrow(df))
  pass_status <- logical(nrow(df))
  
  for (i in seq_len(nrow(df))) {
    score <- df$Score[i]
    
    if (score >= 90) {
      grades[i] <- "A"
    } else if (score >= 80) {
      grades[i] <- "B"
    } else if (score >= 70) {
      grades[i] <- "C"
    } else if (score >= 60) {
      grades[i] <- "D"
    } else {
      grades[i] <- "F"
    }

    pass_status[i] <- score >= 60
  }

  df$Grade <- factor(grades, levels = c("A", "B", "C", "D", "F"))
  df$Pass <- pass_status
  return(df)
}

# Function: calculate_stats
# This function calculates the average, maximum, and minimum scores from
# the data frame. It returns a list containing the statistics.
calculate_stats <- function(df) {
  avg <- mean(df$Score)
  max_score <- max(df$Score)
  min_score <- min(df$Score)
  return(list(average = avg, max = max_score, min = min_score))
}


# Function: display_summary
# This function displays the students' scores, grades, and pass status.
# It also shows the class average, highest score, and lowest score.
display_summary <- function(df, stats) {
  cat("\nSummary:\n")
  for (i in seq_len(nrow(df))) {
    cat("ID:", df$ID[i], "-", df$Name[i], "- Score:", df$Score[i],
        "- Grade:", as.character(df$Grade[i]), "- Pass:", df$Pass[i], "\n")
  }
  cat("\nClass Average:", round(stats$average, 1))
  cat("\nHighest Score:", stats$max)
  cat("\nLowest Score:", stats$min, "\n")
}


# Function: main
# The program meets the desired requirments of displaying 
# output in a terminal, incorporating 5 different R datatypes,
# using loops with lists, and using dataframes. It also includes
# reading from a CSV file and handling errors if the file is not found.
main <- function() {
  # Set to TRUE if using a CSV file
  csv_input <- TRUE

  df <- load_data(csv_input)
  df <- grade_students(df)
  stats <- calculate_stats(df)
  display_summary(df, stats)
}

# Run the program
main()
