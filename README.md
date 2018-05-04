# GraphQLStudy

The goal of this project is to analyze how adding the ApolloGraphQL to a small project will affect it's build time.

### How to measure build times

Xcode doesn't generate build times by default. To do so, the following command was entered on the terminal:

```sh
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
```

The build time is then displayed in the activity viewer.

> Activity viewer is the window in the middle top of Xcode where it shows what is currently being build and how far in the process it is.

### Summary

###### First builds or building after clean

Condition | Build times (Big project) | Build times (Small project)
--------- | ----- | ------
Without Apollo (First build) | x | ~6s
With Apollo - empty query (First build) | x | ~9s
With a query (First build) | x | ~12s
With a query (After clean) | x | ~8s
Decreasing query size (First build) | x | ~10s
Decreasing query size (After clean) | x | ~8s

###### Rebuilding without changes

Condition | Rebuild times (Big project) | Rebuild times (Small project)
--------- | ----- | ------
Without Apollo | x | ~1s
With Apollo - empty query | x | ~4s
With a query | x | ~4s
Decreasing query size | x | ~5s

###### Changing branches (without clean)

Condition | Rebuild times (Big project) | Rebuild times (Small project)
--------- | ----- | ------
Changing query | x | ~5s
Changing classes | x | ~5s

### Build time measurements (Raw data)

###### Empty project

- First build after clean: 4.456s | 11.502s | 5.572s | 9.321s | 10.059s

  Average time: 8,182s

###### After adding a Cartfile and Carthage script

- First build after clean:  4.076s | 3.044s | 8.810s | 4.868s | 7.512s

  Average time: 5,662s

- Rebuild without changes: 0.777s | 1.042s | 0.855s | 0.841s | 0.876s

  Average time: 0,8842s

###### After adding Apollo with empty query

- First build after clean: 8.425s | 5.847s | 12.270s | 9.525s | 6.838s

  Average time: 8,581s

- Rebuild without changes: 3.962s | 3.748s | 5.023s   | 3.616s | 3.811s

  Average time: 4,032s

###### After adding a query and calling it from code

- First build after clean: 12.226s | 6.569s | 8.000s | 7.273s | 5.723s

  Average time: 7,958s

- Rebuild without changes: 3.700s | 3.568s | 4.109s | 3.830s | 3.886s

  Average time: 3,819s

###### Making the query smaller

- First build after clean: 10.210s | 7.012s | 5.987s | 9.158s | 6.047s

  Average time: 7,683s

- Rebuild without changes: 5.896s | 3.728s | 4.264s | 3.945s | 4.789s

  Average time: 4,524s

###### Changing branches that changes only the query (and it's use)

- From smaller to bigger query: 6.137s | 5.267s | 6.176s

  Average time: 5,86s

- From bigger to smaller query: 5.613s | 5.086s | 5.133s

  Average time: 5,28s

###### Changing branches that changes only classes not related to Apollo

- From less classes to more classes: 4.628s | 4.985s | 4.772s  

  Average time: 4,80s

- From more classes to less classes: 4.457s | 4.546s | 4.699s

  Average time: 4,57s
