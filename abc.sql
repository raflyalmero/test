-- ============================================================
-- 1. TABLE films
-- ============================================================
CREATE TABLE films (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,
    rating VARCHAR(10),
    release_date DATE,
    director VARCHAR(255),
    synopsis TEXT
);

INSERT INTO films (title, genre, duration, rating, release_date, director, synopsis) VALUES
('Avatar: The Way of Water', 'Sci-Fi', 192, 'PG-13', '2022-12-16', 'James Cameron', 'Jake Sully hidup dengan keluarga barunya di Pandora dan menghadapi ancaman baru.'),
('Oppenheimer', 'Biography', 180, 'R', '2023-07-21', 'Christopher Nolan', 'Kisah J. Robert Oppenheimer dan pengembangan bom atom dalam Proyek Manhattan.'),
('Barbie', 'Comedy', 114, 'PG-13', '2023-07-21', 'Greta Gerwig', 'Barbie dikeluarkan dari Barbie Land karena tidak sempurna dan pergi ke dunia nyata.'),
('Spider-Man: Across the Spider-Verse', 'Animation', 140, 'PG', '2023-06-02', 'Joaquim Dos Santos', 'Miles Morales bertemu dengan Spider-Man dari berbagai dimensi dalam misi baru.'),
('The Batman', 'Action', 176, 'PG-13', '2022-03-04', 'Matt Reeves', 'Bruce Wayne mengungkap konspirasi korupsi yang melibatkan elite Gotham City.'),
('Dune: Part Two', 'Sci-Fi', 166, 'PG-13', '2024-03-01', 'Denis Villeneuve', 'Paul Atreides bergabung dengan suku Fremen untuk membalas dendam keluarganya.'),
('Joker: Folie à Deux', 'Musical', 138, 'R', '2024-10-04', 'Todd Phillips', 'Arthur Fleck bertemu Harley Quinn di Arkham dan menjalani persidangan.'),
('Inside Out 2', 'Animation', 96, 'PG', '2024-06-14', 'Kelsey Mann', 'Petualangan baru di dalam pikiran Riley saat ia memasuki masa remaja.'),
('Mission: Impossible – Dead Reckoning', 'Action', 163, 'PG-13', '2023-07-12', 'Christopher McQuarrie', 'Ethan Hunt dan timnya berburu kunci untuk mengendalikan entitas AI berbahaya.'),
('The Nun II', 'Horror', 110, 'R', '2023-09-08', 'Michael Chaves', 'Suster Irene berhadapan lagi dengan iblis Valak di sebuah sekolah di Prancis.');

-- ============================================================
-- 2. TABLE cinemas
-- ============================================================
CREATE TABLE cinemas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    city VARCHAR(100),
    total_studio INT
);

INSERT INTO cinemas (name, location, city, total_studio) VALUES
('CGV Grand Indonesia', 'Lantai 5 Mall Grand Indonesia', 'Jakarta', 8),
('Cinema XXI Plaza Senayan', 'Plaza Senayan Lantai 3', 'Jakarta', 10),
('CGV Trans Studio Mall', 'Trans Studio Mall Cibubur', 'Depok', 6),
('Cinema XXI Surabaya Town Square', 'Surabaya Town Square', 'Surabaya', 7),
('CGV Bandung Supermall', 'Bandung Supermall Lantai 4', 'Bandung', 5),
('Platinum Cineplex', 'Mall Taman Anggrek', 'Jakarta', 4),
('Cinema XXI Medan Center', 'Medan Center Point', 'Medan', 6),
('CGV Malang Town Square', 'Malang Town Square', 'Malang', 5),
('Cinema XXI Makassar', 'Panakkukang Mall', 'Makassar', 7),
('XXI Semarang', 'Paragon Mall Semarang', 'Semarang', 6);

-- ============================================================
-- 3. TABLE showtimes
-- ============================================================
CREATE TABLE showtimes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT,
    cinema_id INT,
    studio_number INT,
    show_date DATE,
    show_time TIME,
    price DECIMAL(10,2),
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id)
);

INSERT INTO showtimes (film_id, cinema_id, studio_number, show_date, show_time, price) VALUES
(1, 1, 1, '2026-06-25', '10:00:00', 50000),
(1, 1, 1, '2026-06-25', '13:30:00', 50000),
(1, 1, 1, '2026-06-25', '17:00:00', 55000),
(2, 1, 3, '2026-06-25', '11:00:00', 45000),
(2, 2, 1, '2026-06-25', '14:00:00', 50000),
(3, 2, 2, '2026-06-25', '10:30:00', 45000),
(3, 3, 1, '2026-06-25', '16:00:00', 40000),
(4, 3, 2, '2026-06-26', '12:00:00', 45000),
(4, 4, 1, '2026-06-26', '15:30:00', 48000),
(5, 4, 3, '2026-06-26', '19:00:00', 55000),
(5, 5, 1, '2026-06-26', '11:30:00', 42000),
(6, 5, 2, '2026-06-27', '13:00:00', 50000),
(6, 6, 1, '2026-06-27', '16:30:00', 52000),
(7, 6, 2, '2026-06-27', '20:00:00', 55000),
(7, 7, 1, '2026-06-27', '10:00:00', 43000),
(8, 7, 3, '2026-06-28', '12:30:00', 40000),
(8, 8, 1, '2026-06-28', '15:00:00', 45000),
(9, 8, 2, '2026-06-28', '18:30:00', 50000),
(9, 9, 1, '2026-06-28', '11:00:00', 46000),
(10, 9, 2, '2026-06-29', '14:30:00', 48000),
(10, 10, 1, '2026-06-29', '17:30:00', 50000),
(1, 10, 3, '2026-06-29', '20:30:00', 55000),
(2, 2, 5, '2026-06-29', '10:15:00', 45000),
(3, 3, 3, '2026-06-30', '13:45:00', 42000),
(4, 4, 2, '2026-06-30', '16:15:00', 48000);

-- ============================================================
-- 4. TABLE seats
-- ============================================================
CREATE TABLE seats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cinema_id INT,
    studio_number INT,
    seat_row CHAR(2),
    seat_number INT,
    seat_type VARCHAR(20) DEFAULT 'regular', -- regular, vip, premium
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id),
    UNIQUE KEY unique_seat (cinema_id, studio_number, seat_row, seat_number)
);

INSERT INTO seats (cinema_id, studio_number, seat_row, seat_number, seat_type, is_available) VALUES
-- Studio 1 CGV Grand Indonesia (cinema_id=1)
(1, 1, 'A', 1, 'regular', TRUE), (1, 1, 'A', 2, 'regular', TRUE), (1, 1, 'A', 3, 'vip', TRUE), (1, 1, 'A', 4, 'vip', TRUE), (1, 1, 'A', 5, 'regular', TRUE),
(1, 1, 'B', 1, 'regular', TRUE), (1, 1, 'B', 2, 'regular', TRUE), (1, 1, 'B', 3, 'regular', TRUE), (1, 1, 'B', 4, 'regular', TRUE), (1, 1, 'B', 5, 'regular', TRUE),
(1, 1, 'C', 1, 'premium', TRUE), (1, 1, 'C', 2, 'premium', TRUE), (1, 1, 'C', 3, 'premium', TRUE), (1, 1, 'C', 4, 'premium', TRUE), (1, 1, 'C', 5, 'premium', TRUE),
(1, 1, 'D', 1, 'regular', TRUE), (1, 1, 'D', 2, 'regular', TRUE), (1, 1, 'D', 3, 'regular', TRUE), (1, 1, 'D', 4, 'regular', TRUE), (1, 1, 'D', 5, 'regular', TRUE),

-- Studio 2 CGV Grand Indonesia (cinema_id=1)
(1, 2, 'A', 1, 'regular', TRUE), (1, 2, 'A', 2, 'regular', TRUE), (1, 2, 'A', 3, 'regular', TRUE), (1, 2, 'A', 4, 'regular', TRUE), (1, 2, 'A', 5, 'regular', TRUE),
(1, 2, 'B', 1, 'vip', TRUE), (1, 2, 'B', 2, 'vip', TRUE), (1, 2, 'B', 3, 'vip', TRUE), (1, 2, 'B', 4, 'regular', TRUE), (1, 2, 'B', 5, 'regular', TRUE),
(1, 2, 'C', 1, 'regular', TRUE), (1, 2, 'C', 2, 'regular', TRUE), (1, 2, 'C', 3, 'regular', TRUE), (1, 2, 'C', 4, 'regular', TRUE), (1, 2, 'C', 5, 'regular', TRUE),

-- Studio 1 Plaza Senayan (cinema_id=2)
(2, 1, 'A', 1, 'regular', TRUE), (2, 1, 'A', 2, 'regular', TRUE), (2, 1, 'A', 3, 'regular', TRUE), (2, 1, 'A', 4, 'regular', TRUE), (2, 1, 'A', 5, 'regular', TRUE),
(2, 1, 'B', 1, 'vip', TRUE), (2, 1, 'B', 2, 'vip', TRUE), (2, 1, 'B', 3, 'vip', TRUE), (2, 1, 'B', 4, 'vip', TRUE), (2, 1, 'B', 5, 'regular', TRUE),
(2, 1, 'C', 1, 'premium', TRUE), (2, 1, 'C', 2, 'premium', TRUE), (2, 1, 'C', 3, 'premium', TRUE), (2, 1, 'C', 4, 'regular', TRUE), (2, 1, 'C', 5, 'regular', TRUE),

-- Studio 2 Plaza Senayan (cinema_id=2)
(2, 2, 'A', 1, 'regular', TRUE), (2, 2, 'A', 2, 'regular', TRUE), (2, 2, 'A', 3, 'regular', TRUE), (2, 2, 'A', 4, 'regular', TRUE), (2, 2, 'A', 5, 'regular', TRUE),
(2, 2, 'B', 1, 'regular', TRUE), (2, 2, 'B', 2, 'regular', TRUE), (2, 2, 'B', 3, 'regular', TRUE), (2, 2, 'B', 4, 'regular', TRUE), (2, 2, 'B', 5, 'regular', TRUE),
(2, 2, 'C', 1, 'vip', TRUE), (2, 2, 'C', 2, 'vip', TRUE), (2, 2, 'C', 3, 'regular', TRUE), (2, 2, 'C', 4, 'regular', TRUE), (2, 2, 'C', 5, 'regular', TRUE),

-- Studio 1 Trans Studio Mall (cinema_id=3)
(3, 1, 'A', 1, 'regular', TRUE), (3, 1, 'A', 2, 'regular', TRUE), (3, 1, 'A', 3, 'regular', TRUE), (3, 1, 'A', 4, 'regular', TRUE), (3, 1, 'A', 5, 'regular', TRUE),
(3, 1, 'B', 1, 'regular', TRUE), (3, 1, 'B', 2, 'regular', TRUE), (3, 1, 'B', 3, 'regular', TRUE), (3, 1, 'B', 4, 'regular', TRUE), (3, 1, 'B', 5, 'regular', TRUE),
(3, 1, 'C', 1, 'regular', TRUE), (3, 1, 'C', 2, 'regular', TRUE), (3, 1, 'C', 3, 'regular', TRUE), (3, 1, 'C', 4, 'regular', TRUE), (3, 1, 'C', 5, 'regular', TRUE);

-- ============================================================
-- 5. TABLE bookings
-- ============================================================
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_code VARCHAR(50) UNIQUE NOT NULL,
    showtime_id INT,
    seat_id INT,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    customer_phone VARCHAR(20),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status ENUM('pending', 'paid', 'cancelled') DEFAULT 'pending',
    total_price DECIMAL(10,2),
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id)
);

INSERT INTO bookings (booking_code, showtime_id, seat_id, customer_name, customer_email, customer_phone, booking_date, payment_status, total_price) VALUES
('BK-20260625-001', 1, 3, 'Andi Wijaya', 'andi@gmail.com', '081234567890', '2026-06-24 09:30:00', 'paid', 60000),
('BK-20260625-002', 1, 4, 'Budi Santoso', 'budi@gmail.com', '081234567891', '2026-06-24 10:15:00', 'paid', 60000),
('BK-20260625-003', 2, 8, 'Citra Dewi', 'citra@gmail.com', '081234567892', '2026-06-24 11:00:00', 'pending', 50000),
('BK-20260625-004', 3, 12, 'Dedi Kurniawan', 'dedi@gmail.com', '081234567893', '2026-06-24 12:30:00', 'paid', 65000),
('BK-20260625-005', 4, 15, 'Eka Fitriani', 'eka@gmail.com', '081234567894', '2026-06-24 13:45:00', 'paid', 45000),
('BK-20260625-006', 5, 20, 'Fajar Nugroho', 'fajar@gmail.com', '081234567895', '2026-06-24 14:20:00', 'cancelled', 50000),
('BK-20260625-007', 6, 25, 'Gita Permatasari', 'gita@gmail.com', '081234567896', '2026-06-24 15:00:00', 'paid', 45000),
('BK-20260626-008', 7, 30, 'Hendra Pratama', 'hendra@gmail.com', '081234567897', '2026-06-25 09:00:00', 'paid', 40000),
('BK-20260626-009', 8, 35, 'Indah Lestari', 'indah@gmail.com', '081234567898', '2026-06-25 10:30:00', 'paid', 45000),
('BK-20260626-010', 9, 40, 'Joko Susilo', 'joko@gmail.com', '081234567899', '2026-06-25 11:45:00', 'pending', 48000),
('BK-20260626-011', 10, 45, 'Kartika Sari', 'kartika@gmail.com', '081234567800', '2026-06-25 13:00:00', 'paid', 55000),
('BK-20260626-012', 11, 50, 'Lukman Hakim', 'lukman@gmail.com', '081234567801', '2026-06-25 14:30:00', 'paid', 42000),
('BK-20260627-013', 12, 55, 'Maya Anggraini', 'maya@gmail.com', '081234567802', '2026-06-26 09:15:00', 'paid', 50000),
('BK-20260627-014', 13, 60, 'Nanda Putra', 'nanda@gmail.com', '081234567803', '2026-06-26 10:45:00', 'paid', 52000),
('BK-20260627-015', 14, 65, 'Oktavia Dewi', 'oktavia@gmail.com', '081234567804', '2026-06-26 12:00:00', 'pending', 55000),
('BK-20260627-016', 15, 70, 'Pandu Aditya', 'pandu@gmail.com', '081234567805', '2026-06-26 13:30:00', 'paid', 43000),
('BK-20260628-017', 16, 75, 'Qonita Rahma', 'qonita@gmail.com', '081234567806', '2026-06-27 08:45:00', 'paid', 40000),
('BK-20260628-018', 17, 80, 'Rizky Ramadhan', 'rizky@gmail.com', '081234567807', '2026-06-27 10:00:00', 'paid', 45000),
('BK-20260628-019', 18, 85, 'Siti Khadijah', 'siti@gmail.com', '081234567808', '2026-06-27 11:30:00', 'cancelled', 50000),
('BK-20260628-020', 19, 90, 'Taufik Hidayat', 'taufik@gmail.com', '081234567809', '2026-06-27 13:00:00', 'paid', 46000),
('BK-20260629-021', 20, 95, 'Umi Kalsum', 'umi@gmail.com', '081234567810', '2026-06-28 09:30:00', 'paid', 48000),
('BK-20260629-022', 21, 100, 'Vina Lestari', 'vina@gmail.com', '081234567811', '2026-06-28 10:45:00', 'pending', 50000),
('BK-20260629-023', 22, 105, 'Wawan Setiawan', 'wawan@gmail.com', '081234567812', '2026-06-28 12:15:00', 'paid', 55000),
('BK-20260629-024', 23, 110, 'Xavier Pranata', 'xavier@gmail.com', '081234567813', '2026-06-28 13:45:00', 'paid', 45000),
('BK-20260630-025', 24, 115, 'Yuli Astuti', 'yuli@gmail.com', '081234567814', '2026-06-29 09:00:00', 'paid', 42000),
('BK-20260630-026', 25, 120, 'Zaki Zainal', 'zaki@gmail.com', '081234567815', '2026-06-29 10:30:00', 'paid', 48000);