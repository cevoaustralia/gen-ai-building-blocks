-- Create Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Categories table
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create Reviews table
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert synthetic data into Users table
INSERT INTO Users (username, email, password, first_name, last_name, address, phone, created_at, updated_at)
VALUES 
('john_doe', 'john@example.com', 'password123', 'John', 'Doe', '123 Main St, Anytown, USA', '123-456-7890', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('jane_smith', 'jane@example.com', 'password456', 'Jane', 'Smith', '456 Elm St, Othertown, USA', '987-654-3210', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('bob_brown', 'bob@example.com', 'password789', 'Bob', 'Brown', '789 Oak St, Thistown, USA', '555-555-5555', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('alice_jones', 'alice@example.com', 'password1234', 'Alice', 'Jones', '321 Pine St, Yourtown, USA', '234-567-8901', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('charlie_davis', 'charlie@example.com', 'password5678', 'Charlie', 'Davis', '654 Maple St, Hishtown, USA', '345-678-9012', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('diana_evans', 'diana@example.com', 'password4321', 'Diana', 'Evans', '987 Birch St, Hertown, USA', '456-789-0123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('edward_wilson', 'edward@example.com', 'password8765', 'Edward', 'Wilson', '654 Oak St, Theirtown, USA', '567-890-1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('fiona_hall', 'fiona@example.com', 'password5674', 'Fiona', 'Hall', '123 Elm St, Sometown, USA', '678-901-2345', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('george_white', 'george@example.com', 'password7890', 'George', 'White', '321 Pine St, Anothertown, USA', '789-012-3456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('hannah_clark', 'hannah@example.com', 'password9876', 'Hannah', 'Clark', '654 Maple St, Thatetown, USA', '890-123-4567', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('ian_lee', 'ian@example.com', 'password6543', 'Ian', 'Lee', '987 Birch St, Heretown, USA', '901-234-5678', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('jessica_adams', 'jessica@example.com', 'password3210', 'Jessica', 'Adams', '654 Oak St, Theirtown, USA', '012-345-6789', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('kevin_martin', 'kevin@example.com', 'password6542', 'Kevin', 'Martin', '123 Elm St, Sometown, USA', '123-456-7890', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('laura_moore', 'laura@example.com', 'password3219', 'Laura', 'Moore', '321 Pine St, Anytown, USA', '234-567-8901', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('michael_taylor', 'michael@example.com', 'password9875', 'Michael', 'Taylor', '654 Maple St, Hishtown, USA', '345-678-9012', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('nina_thomas', 'nina@example.com', 'password4329', 'Nina', 'Thomas', '987 Birch St, Hertown, USA', '456-789-0123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('oliver_miller', 'oliver@example.com', 'password8762', 'Oliver', 'Miller', '654 Oak St, Theirtown, USA', '567-890-1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('paula_martinez', 'paula@example.com', 'password5670', 'Paula', 'Martinez', '123 Elm St, Sometown, USA', '678-901-2345', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('quincy_rodriguez', 'quincy@example.com', 'password7893', 'Quincy', 'Rodriguez', '321 Pine St, Yourtown, USA', '789-012-3456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('rachel_garcia', 'rachel@example.com', 'password9871', 'Rachel', 'Garcia', '654 Maple St, Hishtown, USA', '890-123-4567', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert synthetic data into Categories table
INSERT INTO Categories (name, description, created_at, updated_at)
VALUES 
('Fruity', 'Candles with fruity scents like apple, orange, and berry.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Floral', 'Candles with floral scents like rose, lavender, and jasmine.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Earthy', 'Candles with earthy scents like sandalwood, cedar, and pine.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Spicy', 'Candles with spicy scents like cinnamon, clove, and ginger.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Fresh', 'Candles with fresh scents like mint, eucalyptus, and ocean breeze.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert synthetic data into Products table
INSERT INTO Products (name, description, price, stock_quantity, category_id, created_at, updated_at)
VALUES 
-- Fruity category
('Apple Delight', 'A refreshing apple-scented candle.', 10.99, 100, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Orange Zest', 'A zesty orange-scented candle.', 11.99, 80, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Berry Bliss', 'A delightful berry-scented candle.', 12.99, 70, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Tropical Mango', 'A tropical mango-scented candle.', 13.99, 60, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Pineapple Paradise', 'A sweet pineapple-scented candle.', 14.99, 50, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Floral category
('Lavender Dream', 'A calming lavender-scented candle.', 12.99, 50, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Rose Garden', 'A romantic rose-scented candle.', 13.99, 40, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Jasmine Bloom', 'An exotic jasmine-scented candle.', 14.99, 30, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Lily of the Valley', 'A delicate lily-scented candle.', 15.99, 20, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Violet Petals', 'A sweet violet-scented candle.', 16.99, 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Earthy category
('Cedarwood Bliss', 'An earthy cedarwood-scented candle.', 15.99, 75, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Sandalwood Serenity', 'A serene sandalwood-scented candle.', 16.99, 65, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Patchouli Passion', 'A passionate patchouli-scented candle.', 17.99, 55, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Oakmoss Oasis', 'A tranquil oakmoss-scented candle.', 18.99, 45, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Pine Forest', 'A refreshing pine-scented candle.', 19.99, 35, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Spicy category
('Cinnamon Spice', 'A spicy cinnamon-scented candle.', 14.99, 50, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Clove Comfort', 'A comforting clove-scented candle.', 15.99, 40, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ginger Glow', 'A warming ginger-scented candle.', 16.99, 30, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Nutmeg Nook', 'A cozy nutmeg-scented candle.', 17.99, 20, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Cardamom Charm', 'A charming cardamom-scented candle.', 18.99, 10, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

-- Fresh category
('Minty Fresh', 'A refreshing mint-scented candle.', 11.99, 90, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Eucalyptus Escape', 'An invigorating eucalyptus-scented candle.', 12.99, 80, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ocean Breeze', 'A breezy ocean-scented candle.', 13.99, 70, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Citrus Splash', 'A fresh citrus-scented candle.', 14.99, 60, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Herbal Harmony', 'A harmonious herbal-scented candle.', 15.99, 50, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Synthetic Data for Orders, Order_Items, and Reviews for the past year
DO $$
DECLARE
    v_current_date DATE := NOW() - INTERVAL '1 year';
    v_end_date DATE := NOW();
    v_user_count INT := 20;
    v_product_count INT := 25;
    v_order_id INT;
    v_product_id INT;
    v_user_id INT;
    v_quantity INT;
    v_price DECIMAL(10, 2);
    v_total_amount DECIMAL(10, 2);
    v_rating INT;
    v_review_comment TEXT;
BEGIN
    WHILE v_current_date <= v_end_date LOOP
        -- Generate 1 to 5 orders per day
        FOR i IN 1..(1 + RANDOM() * 4)::INT LOOP
            v_user_id := 1 + RANDOM() * (v_user_count - 1);
            v_total_amount := 0;

            -- Insert Order
            INSERT INTO Orders (user_id, order_date, total_amount, status, created_at, updated_at)
            VALUES (v_user_id, v_current_date, 0, 'Completed', v_current_date, v_current_date)
            RETURNING order_id INTO v_order_id;

            -- Generate 1 to 3 items per order
            FOR j IN 1..(1 + RANDOM() * 2)::INT LOOP
                v_product_id := 1 + RANDOM() * (v_product_count - 1);
                v_quantity := 1 + RANDOM() * 4;
                v_price := (10 + RANDOM() * 10)::DECIMAL(10, 2);
                v_total_amount := v_total_amount + (v_price * v_quantity);

                -- Insert Order_Items
                INSERT INTO Order_Items (order_id, product_id, quantity, price, created_at, updated_at)
                VALUES (v_order_id, v_product_id, v_quantity, v_price, v_current_date, v_current_date);
            END LOOP;

            -- Update total_amount in Orders table
            UPDATE Orders SET total_amount = v_total_amount WHERE order_id = v_order_id;

            -- Insert Review for one of the products in the order
            IF RANDOM() < 0.5 THEN -- 50% chance to leave a review
                v_rating := 1 + RANDOM() * 4;
                v_review_comment := CASE
                    WHEN v_rating = 5 THEN 'Excellent product!'
                    WHEN v_rating = 4 THEN 'Very good, highly recommended.'
                    WHEN v_rating = 3 THEN 'Average, could be better.'
                    WHEN v_rating = 2 THEN 'Not as expected.'
                    ELSE 'Very disappointed.'
                END;

                INSERT INTO Reviews (product_id, user_id, rating, comment, created_at, updated_at)
                VALUES (v_product_id, v_user_id, v_rating, v_review_comment, v_current_date, v_current_date);
            END IF;
        END LOOP;

        -- Increment the current_date by one day
        v_current_date := v_current_date + INTERVAL '1 day';
    END LOOP;
END $$;



