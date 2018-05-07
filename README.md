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

###### First builds (after clean)

Condition | Build times (Big project) | Build times (Small project)
--------- | ----- | ------
Without Apollo | ~120s | ~6s
With Apollo - empty query | ~133s | ~9s
With a query | ~145s | ~12s
Decreasing query size | ~128s | ~10s

###### Rebuilding without changes

Condition | Rebuild times (Big project) | Rebuild times (Small project)
--------- | ----- | ------
Without Apollo | ~5,5s | ~1s
With Apollo - empty query | ~6s | ~4s
With a query | ~8s | ~4s
Decreasing query size | ~16s | ~5s

###### Changing branches (without clean)

Condition | Rebuild times (Big project) | Rebuild times (Small project)
--------- | ----- | ------
Changing query (smaller to bigger)| ~14s | ~5s
Changing query (bigger to smaller)| ~12s | ~5s
Changing classes (less to more)| ~19s | ~5s
Changing classes (more to less)| **_~110s_** | ~5s

### Build time measurements (Raw data)

#### Smaller project

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

#### Bigger project

###### After adding a Cartfile and Carthage script

- First build after clean: 111,669 + 124,746 + 129,718
- Rebuild without changes: 3,411 + 3,388 + 9,618

###### After adding Apollo with empty query

- First build: 133,102s
- Rebuild: 5,8s

###### After adding a query and calling it from code

- First build: 145,879s
- Rebuild: 8,273s

###### Making the query smaller

- First build: 128,342s
- Rebuild: 16,285s

###### Changing branches that changes only the query (and it's use)

- Switch (smaller to bigger): 14,060s
- Switch (bigger to smaller): 12,932s

###### Changing branches that changes only classes not related to Apollo

- Switch less to more classes: 15,960 + 21,234 + 20,756 = 19,32s
- Switch more classes to less: 99,975 + 114,129 + 117,245 = 110,45s

### Conclusion

The adding of the Apollo framework didn't seem to be a problem until switching between branches with different classes in a bigger project.
As seen in the building log and confirmed by the building times, when changing to a branch with more classes the incremental build seems to be broken, once all code are being compiled again.

Changing from a ~20s compile time to a ~110s compile time is a big price to pay for adding a framework.
