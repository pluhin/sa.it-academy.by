const express = require('express');
const db = require('../db');

const router = express.Router();

router.get('/date', async (req, res) => {
  try {
    const result = await db.query('SELECT CURRENT_DATE as current_date');
    const currentDate = result.rows[0].current_date;

    res.send(currentDate);
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).send('Error executing query');
  }
});

module.exports = router;
