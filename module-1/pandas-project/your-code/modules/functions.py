def get_poor_rows(df,nulls = 2):
    #returns indexes of rows with more than 2 Nulls in it.
    return [index for index, fila in df.iterrows() if fila.isnull().sum() > nulls]

def drop_by_index(df, *indexes):
    #Drop rows by a given index or list of indexes.
    return df.drop(df.iloc[indexes].index)
