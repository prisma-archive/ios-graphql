# iOS & Apollo Quickstart

* [Apollo Client](https://github.com/apollographql/apollo-client): Fully-featured, production ready caching GraphQL client
* [Graphcool](https://www.graph.cool): Flexible backend platform combining GraphQL + AWS Lambda

For more information on how to get started refer to the [full ios-apollo-instagram tutorial](https://www.graph.cool/docs/quickstart/ios-apollo-instagram/).


## Example

![](http://imgur.com/Tp65mEc.gif)

## Quickstart

### 1. Clone example repository

```sh
git clone https://github.com/graphcool-examples/ios.git
cd ios-graphql/quickstart-with-apollo
```

### 2. Create GraphQL API with [`graphcool`](https://www.npmjs.com/package/graphcool)

```sh
# Install Graphcool CLI
npm install -g graphcool

# Create a new project based on the Instagram schema
graphcool init --schema https://graphqlbin.com/instagram.graphql 
```

This creates a GraphQL API for the following schema:

```graphql
type Post {
  description: String!
  imageUrl: String!
}
```

### 3. Connect the app with your GraphQL API

Copy the `Simple API` endpoint into `AppDelegate.swift`  to instantiate the `ApolloClient`:

```js
// replace `__SIMPLE_API_ENDPOINT__` with the endpoint from the previous step
let apollo = ApolloClient(url: URL(string: "__SIMPLE_API_ENDPOINT__")!)
```

### 4. Install `apollo-codegen`

To use the Apollo iOS Client, you need to install `apollo-codegen`, a command line tool that will generate Swift types from your GraphQL queries & mutations at build-time. 

```sh
npm install -g apollo-codegen
```

You can find more info the in the [Apollo docs](http://dev.apollodata.com/ios/installation.html).

### 5. Install dependencies & run locally

```sh
carthage update
```

Start the app in Xcode 🚀

## Next steps

* [Advanced GraphQL features](https://www.graph.cool/docs/tutorials/advanced-features-eath7duf7d/)
* [Authentication & Permissions](https://www.graph.cool/docs/reference/authorization/overview-iegoo0heez/)
* [Implementing business logic with serverless functions](https://www.graph.cool/docs/reference/functions/overview-boo6uteemo/)


## Help & Community [![Slack Status](https://slack.graph.cool/badge.svg)](https://slack.graph.cool)

Join our [Slack community](http://slack.graph.cool/) if you run into issues or have questions. We love talking to you!

![](http://i.imgur.com/5RHR6Ku.png)
