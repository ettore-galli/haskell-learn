fn main() {
    println!("Hello, world!");

    let first: String = String::from("aaa");
    let second: String;

    println!("first: {}", first);

    second = first.clone();
    println!("second: {}", second);

    println!("first: {}", first);

    println!("first: {}", &first);

    let mut letters: [char; 7];
    letters = ['c', 'i', 'a', 'o', ' ', ' ', ' '];

    let arrlen = process_array(&letters);
    println!("len of array: {}", arrlen);
    display_array(&letters);
    fill_array(&mut letters);
    display_array(&letters);
}

// borrowed reference
fn display_array(letters: &[char]) -> () {
    for char in letters {
        print!("{}\t", char);
    }
    print!("\n")
}

// borrowed reference
fn process_array(letters: &[char]) -> usize {
    letters.len()
}

// borrowed mutable reference
fn fill_array(letters: &mut [char]) -> () {
    letters[4] = '4';
    letters[5] = '5';
    letters[6] = '6';
}
