
CREATE VIEW IF NOT EXISTS transaction_inputs_view AS
SELECT
    ti.id AS input_id,
    ti.txid AS input_txid,
    ti.input_index,
    ti.prev_txid,
    ti.prev_output_index,
    t.block_hash,
    t.version,
    t.lock_time
FROM transaction_inputs ti
JOIN transactions t ON ti.txid = t.txid;

CREATE VIEW IF NOT EXISTS transaction_outputs_view AS
SELECT
    to.id AS output_id,
    to.txid AS output_txid,
    to.output_index,
    to.amount,
    to.recipient_address,
    to.spent,
    t.block_hash,
    t.version,
    t.lock_time
FROM transaction_outputs to
JOIN transactions t ON to.txid = t.txid;
