fn main() {
    let mut x: i8 = 10;
    println!("# i 1 {}", x);
    x = 127;
    println!("# i 2 {}", x);

    let f1: f64;

    f1 = 0.1 + 0.2;

    println!("# f 1 {}", f1);

    let a: i32 = 10;
    let b: f32 = 3.0;

    println!(
        "sum {result:030.9}, {result}, {result}, {result}, {result}",
        result = a as f32 / b
    );

    let b1: u8 = 0b1000_0001;
    let b2: u8 = 0b0000_1111;
    println!("b1={}", b1);
    println!("b1={0:08b}, {1:08b}", b1, !b1);
    println!("b1={0:08b}, {1:08b}", b1 & b2, b1 | b2);
    println!("b1={}, {}", b1 & 0b1000_0000, b1 & 0b0100_0000);
    println!("b1={}, {}", b1 & 0b1000_0000 > 0, b1 & 0b0100_0000 > 0);

    let b3: u8 = 0b1;
    println!(
        "{}, {}, {}, {}, {}, {}, {}",
        b3,
        b3 << 1,
        b3 << 2,
        b3 << 3,
        b3 << 4,
        b3 << 5,
        b3 << 6
    );

    let c1: char = '\u{1a2c}';
    println!("{}", c1);

    let aa = 13;
    let bb = 2.3;
    let cc: f32 = 120.0;

    let average = (1.0 * aa as f64 + bb + cc as f64) / 3.0;

    assert_eq!(average, 45.1);

    let chrs = ['a', 'b', 'c'];
    println!("{}", chrs[1]);

    let numbers: [i32; 5];
    numbers = [0; 5]; //[0, 0, 0, 0, 0];
    let index: usize = numbers.len() - 1;
    println!("{}", numbers[index]);

    let various = (10, 'x', 3.14);
    println!("{}, {}, {}", various.0, various.1, various.2);

    println!("---------- ---------- ---------- ----------");

    let cels = 23.0;
    let fahr = celsius_to_fahrenheit(cels);

    assert_eq!(fahr, 73.4);

    println!("---------- ---------- ---------- ----------");

    if cels > 20.0 {
        println!("OK");
    }

    let mut cnt = 0;
    loop {
        cnt += 1;
        if cnt > 100 {
            break;
        }
        if cnt % 10 == 0 {
            println!("{}", cnt);
        }
    }

    cnt = 0;
    while cnt < 10 {
        cnt += 1;
        println!("{}", cnt);
    }

    println!("---------- ---------- ---------- ----------");

    let message = ['h', 'e', 'l', 'l', 'o'];

    for letter in message {
        print!("{}", letter);
    }

    for (index, letter) in message.iter().enumerate() {
        println!("{}, {}", index, letter);
    }

    for (index, &letter) in message.iter().enumerate() {
        if letter == 'l' {
            println!("_");
        }
        println!("{}, {}", index, letter);
    }

    for letter in message {
        if letter == 'l' {
            print!("_");
        }
        print!("{}", letter);
    }
    println!("---------- ---------- ---------- ----------");

    let mut numb3rs = [1, 2, 3, 4, 5];
    prt_numbers(numb3rs);
    for numb3r in numb3rs.iter_mut() {
        *numb3r += 100;
    }
    prt_numbers(numb3rs);

    println!("---------- ---------- ---------- ----------");
    let numbers = [3, 1, 6, 3, 5, 6, 3, 2, 5, 7, 9, 2];
    let mut minn: i32;
    let mut maxn: i32;
    let mut avgn: f64;

    minn = numbers[0];
    maxn = numbers[0];
    avgn = 0.0;
    for n in numbers {
        if n < minn {
            minn = n;
        }
        if n > maxn {
            maxn = n;
        }
        avgn += n as f64;
    }
    avgn /= numbers.len() as f64;

    assert_eq!(minn, 1);
    assert_eq!(maxn, 9);
    assert_eq!(avgn, 4.333333333333333);

    println!("{}, {}, {} (in line)", minn, maxn, avgn);

    minn = numbers[0];
    maxn = numbers[0];
    avgn = 0.0;
    println!("{}, {}, {} (reset)", minn, maxn, avgn);

    (minn, maxn, avgn) = statistics(&numbers);

    println!("{}, {}, {} (function)", minn, maxn, avgn);

    println!("---------- ---------- ---------- ----------");
}

fn statistics(data: &[i32]) -> (i32, i32, f64) {
    let mut min: i32 = data[0];
    let mut max: i32 = data[0];
    let mut avg: f64 = 0.0;
    for x in data {
        if *x < min {
            min = *x;
        }
        if *x > max {
            max = *x;
        }
        avg += *x as f64;
    }
    avg /= data.len() as f64;
    return (min, max, avg);
}

fn prt_numbers(nbr: [i32; 5]) -> () {
    for nb in nbr {
        print!("{} ", nb);
    }
    print!("\n");
}

fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 1.8 + 32.0
}
