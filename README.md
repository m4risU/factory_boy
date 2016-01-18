Based on FactoryGirl syntax lib is froviding DSL to define objects with FactoryBoy.

Defining User class like following

```
FactoryBoy.define_factory(:user) do
  name "fobar"
end
```
and calling build method on FactoryBoy

```
FactoryBoy.build(:user)

and
```

will return User instance with default attributes

```
#<User:0x007fb98492834 @name="foobar">
```

Again calling the following:


```
FactoryBoy.define_factory(:admin, class: User) do
  name "fobar"
  admin true
end

FactoryBoy.build(:admin)
```

will return initialized object with attributes overriden by build method

```
#<User:0x007fb98492834 @name="foobar" @admin=true>
```
