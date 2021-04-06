SELECT TABLE_NAME 'Table', COLUMN_NAME 'Field', COLUMN_TYPE 'Type', IS_NULLABLE 'Nullable',
  COLUMN_KEY 'Key', COLUMN_DEFAULT 'Default', EXTRA 'Extra'
FROM information_schema.columns
WHERE table_schema = 'posdb'
ORDER BY TABLE_NAME;