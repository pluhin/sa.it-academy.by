import pandas as pd

data = {
    'Employee_id': ['1', '2', '3', '4', '5'],
    'Employee_name': ['Akshar', 'Jones', 'Kate', 'Mike', 'Tina']
}

df = pd.DataFrame(data)

df['New_column'] = df['Employee_id'].astype(int) * 2

df.to_csv('example.csv', index=False)

print("Save table to example.csv")
