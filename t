import pandas as pd

# Sample student data
data = {
    "Subject": ["Math", "Python", "Statistics", "DBMS", "English"],
    "Marks": [65, 80, 55, 70, 85]
}

df = pd.DataFrame(data)

# Identify weak subjects (marks < 70)
df["Priority"] = df["Marks"].apply(lambda x: "High" if x < 70 else "Normal")

# Assign study hours
def assign_hours(priority):
    if priority == "High":
        return 3
    else:
        return 1

df["Daily Study Hours"] = df["Priority"].apply(assign_hours)

print("\n📊 Smart Study Plan\n")
print(df)

# Weekly schedule
print("\n📅 Weekly Study Time Allocation:")
print(df.groupby("Subject")["Daily Study Hours"].sum() * 7)
