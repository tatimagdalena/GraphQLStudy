# GraphQLStudy

The goal of this project is to analyze how adding the ApolloGraphQL to a small project will affect it's build time.

### How to measure build times

Xcode doesn't generate build times by default. To do so, the following command was entered on the terminal:

```sh
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
```

The build time is then displayed in the activity viewer.

> Activity viewer is the window in the middle top of Xcode where it shows what is currently being build and how far in the process it is.

### Build time measurements

###### Empty project

- First build after clean: 4.456s | 11.502s | 5.572s | 9.321s | 10.059s

  Average time: 8,182s

###### After adding a Cartfile and Carthage script

- First build after clean:  4.076s | 3.044s | 8.810s | 4.868s | 7.512s

  Average time: 5,662s

- Rebuild without changes: 0.777s | 1.042s | 0.855s | 0.841s | 0.876s

  Average time: 0,8842s
