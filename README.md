
```
query places {
  places {
    id
    city
    department
    latitude
    longitude
    title
    users {
      id
      inserted_at
    }
  }
}
```

Error: GraphQL error: Cannot query field "inserted_at" on type "User"
