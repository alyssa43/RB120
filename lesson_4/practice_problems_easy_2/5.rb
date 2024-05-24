# There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

# Answer =>
# The first variable listed is a local variable. We know this because it is being initialized by simply just writing the name of the variable with an `=`, followed by the value it is to reference. 

# The second variable listed is an instance variable. We know this because it is being initialized by writing the `@` symbol, followed by the name of the variable with an `=` followed by the value it is to reference.

# The third variable listed is a class variable. We know this because it is being initialized by writing `@@`, followed by the name of the variable with an `=` followed by the value it is to reference.