use serde::{Deserialize, Serialize};
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug, Serialize, Deserialize)]
struct Task {
    name: String,          // Immutable: task description (owned String)
    completed: bool,       // Mutable: completion status
    importance: u8,        // Immutable: 1=High, 2=Medium, 3=Low
    time_added: u64,       // Immutable: timestamp for sorting
}

fn main() {
    // Welcome message (immutable)
    let welcome = "Welcome, please choose an action (print an integer and hit enter):";
    println!("{}", welcome);

    loop {
        // Mutable Vec for tasks (stretch: data structure)
        let mut tasks: Vec<Task> = Vec::new();

        // Menu (immutable)
        let menu = "\nMenu:\n1. Add Task\n2. List Tasks\n3. Remove Task\n4. Mark Task Complete\n5. Export to File\n6. Import from File\n7. Quit\nEnter choice (1-7): ";
        print!("{}", menu);

        // Get user input (mutable)
        let mut action = String::new();
        std::io::stdin().read_line(&mut action).expect("Failed to read input");

        // Expression: Parse input to usize (expression requirement)
        let choice: usize = action.trim().parse().unwrap_or(0);

        // Conditionals: Handle menu choice (conditional requirement)
        match choice {
            1 => add_task(&mut tasks),                   // Add task
            // 2 => list_tasks(&tasks),                     // List tasks
            // 3 => remove_task(&mut tasks),                // Remove task
            // 4 => mark_complete(&mut tasks),              // Mark complete
            // 5 => sort_tasks(&mut tasks),                 // Sort tasks
            // 6 => export_tasks(&tasks, "tasks.json"),     // Export to JSON
            // 7 => tasks = import_tasks("tasks.json"),     // Import from JSON
            8 => {
                println!("Goodbye");
                break; // Exit loop
            }
            _ => println!("Invalid choice, please enter 1-8"),
        }
    }
}


// Function to add a task (function, ownership, references)
fn add_task(tasks: &mut Vec<Task>) {
    // Query user for task name
    print!("Enter task name: ");
    let mut name = String::new();
    std::io::stdin().read_line(&mut name).expect("Failed to read input");
    let name = name.trim();

    // Validate name (conditional)
    if name.is_empty() {
        println!("Error: Task name cannot be empty");
        return;
    }

    // Query user for importance
    print!("Enter importance of task (1=High, 2=Medium, 3=Low): ");
    let mut importance = String::new();
    std::io::stdin().read_line(&mut importance).expect("Failed to read input");

    // Parse importance or default to 3 (expression)
    let importance: u8 = importance.trim().parse().unwrap_or(3).clamp(1, 3);

    // Get current timestamp (expression)
    let time_added = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_secs();

    // Create task (ownership: name becomes owned String)
    let task = Task {
        name: String::from(name),
        completed: false,
        importance,
        time_added,
    };

    // Add to Vec
    tasks.push(task);
    println!("Added task: {}", name);
}

