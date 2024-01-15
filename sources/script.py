import pandas as pd
import numpy as np

np.random.seed(42)

# Create a dataframe with random data
data = {'Column1': np.random.rand(10),
        'Column2': np.random.randint(0, 100, 10),
        'Column3': np.random.choice(['a', 'b', 'c'], 10)}
df = pd.DataFrame(data)


# Save the dataframe as a CSV file
df.to_csv('data/random_data.csv', index=False)

# Import the dataframe from the CSV file
imported_df = pd.read_csv('data/random_data.csv')
