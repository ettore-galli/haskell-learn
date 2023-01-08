use std::any::type_name;

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

    // ----------------------------------

    let message: String = String::from("Message in a bottle");
    println!("Msg: <<{}>>", message);
    display_string_reference(&message);

    let messagepart: &str = &message[10..message.len()];
    println!("Part: <<{}>>", messagepart);
    display_string_slice(&messagepart);
    display_string_slice(&message);
    display_string_reference(&decorate(&message));

    // ---------
    let strtoslice: String = String::from("0123456789");
    let start: usize = 0;
    let stop: usize = 5;
    println!("SLICE[{}..{}]={}", start, stop, &strtoslice[start..stop]);
    println!(
        "SLICE[{}..{}]={}",
        0,
        strtoslice.len(),
        &strtoslice[0..strtoslice.len()]
    );

    let totrim_1: String = String::from("  Hello, World !  ");
    println!("Trimmed: §{}§", trim_spaces(&totrim_1));

    let totrim_2: String = String::from("FULL");
    println!("Trimmed: §{}§", trim_spaces(&totrim_2));

    let totrim_3: String = String::from(" 😀 😀 😀         ");
    println!("Trimmed: §{}§", trim_spaces(&totrim_3));

    let totrim_4: String = String::from("  Hello, World !  ");
    println!("Trimmed: §{}§", trim_spaces(&totrim_4));
}

fn display_string_reference(letters: &String) -> () {
    println!("STRING: {}", letters);
}

fn display_string_slice(letters: &str) -> () {
    println!("SLICE: {}", letters);
}

fn type_of<T>(_: T) -> &'static str {
    type_name::<T>()
}

fn decorate(letters: &str) -> String {
    let star = "*";
    println!("{}", type_of(star));
    ("".to_owned() + star + letters + star).to_owned()
}

fn trim_spaces(input: &str) -> &str {
    let str_bytes = input.as_bytes();

    let mut start: usize = 0;
    let mut stop: usize = str_bytes.len();

    for (i, &c) in str_bytes.iter().enumerate() {
        if c != b' ' {
            start = i;
            break;
        }
    }

    for (i, &c) in str_bytes.iter().rev().enumerate() {
        println!("{}", i);
        if c != b' ' {
            stop = str_bytes.len() - i;
            break;
        }
    }

    return &input[start..stop];
}

// fn trim_spaces_2(input: &String) -> &str {
//     let str_bytes = input.as_bytes();

//     let mut start: usize = 0;
//     let mut stop: usize = str_bytes.len();

//     for (i, &c) in str_bytes.iter().enumerate() {
//         if c == b' ' {
//             if start == 0 {
//                 start = i;
//             }
//         } else {
//             stop = i + 1;
//         }
//     }

//     return &input[start..stop];
// }

// fn trim_spaces_1(input: &String) -> &str {
//     let str_bytes = input.as_bytes();

//     let mut start: usize = 0;
//     let mut start_found: bool = false;
//     let mut stop: usize = str_bytes.len();

//     for (i, &c) in str_bytes.iter().enumerate() {
//         if c != b' ' {
//             if !start_found {
//                 start = i;
//                 start_found = true;
//             }
//             stop = i + 1;
//         }
//         // println!("- {} {}", i, start);
//     }

//     return &input[start..stop];
// }

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
