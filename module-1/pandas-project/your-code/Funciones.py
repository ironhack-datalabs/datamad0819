Funciones

1. datashark = pd.read_csv(('../your-code/Input/GSAF5.csv'), engine = 'python')
2.print(datashark.shape)
3.empty_values = datashark.isnull().sum()
4.new = datashark.drop('Unnamed: 22', axis=1)
5.new2 = new.drop('Unnamed: 23', axis=1)
6.new3 = new3.reindex(columns=['Activity','Name', 'Country', 'Sex', 'Type','Time'])
7.new4 = new3.rename(columns={"Activity": "Method", "Type": "Way", "Sex": "Gender"})
8.new5 = new4.groupby("Country")["Way"].sum() 
9.new6 = data.groupby(['Country'])['Time'].count()
