CREATE TABLE IF NOT EXISTS blocks (
    block_hash VARCHAR PRIMARY KEY,
    previous_block_hash VARCHAR,
    merkle_root VARCHAR,
    timestamp TIMESTAMP,
    nonce INTEGER,
    height INTEGER
);

CREATE TABLE IF NOT EXISTS transactions (
    txid VARCHAR PRIMARY KEY,
    block_hash VARCHAR REFERENCES blocks(block_hash),
    version INTEGER,
    lock_time INTEGER
);

CREATE TABLE IF NOT EXISTS transaction_outputs (
    id SERIAL PRIMARY KEY,
    txid VARCHAR REFERENCES transactions(txid),
    output_index INTEGER,
    amount BIGINT,
    recipient_address VARCHAR,
    spent BOOLEAN DEFAULT FALSE,
    UNIQUE (txid, output_index)
);

CREATE TABLE IF NOT EXISTS transaction_inputs (
    id SERIAL PRIMARY KEY,
    txid VARCHAR REFERENCES transactions(txid),
    input_index INTEGER,
    prev_txid VARCHAR,
    prev_output_index INTEGER
);
