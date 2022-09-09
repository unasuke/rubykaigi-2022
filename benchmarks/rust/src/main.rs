use std::time::Instant;

fn main() {
    let hello_world_bytes: [u8; 12] = [
        0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21,
    ];
    let mut count = 0;
    let start = Instant::now();
    while count < 10000 {
        let mut upcased: [u8; 12] = [0x0; 12];

        for (i, char) in hello_world_bytes.iter().enumerate() {
            if 0x41 <= *char && *char <= 0x7a {
                upcased[i] = *char - 0x20
            } else {
                upcased[i] = *char
            }
        }
        // println!("{}", upcased.as_ascii_str().unwrap());
        count += 1
    }
    let end = start.elapsed();
    println!("{}secs", end.as_secs() as f64 + (end.subsec_nanos() as f64 * 1e-9))
}
