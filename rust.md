use std::time::{Instant};

fn main() {
    let start_time = Instant::now();

    // Your code goes here

    let end_time = Instant::now();
    let elapsed_time = end_time.duration_since(start_time);

    println!("Execution time: {:?}", elapsed_time);
}
