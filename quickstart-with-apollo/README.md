# iOS & Apollo Quickstart

* [Apollo Client](https://github.com/apollographql/apollo-client): Fully-featured, production ready caching GraphQL client
* [Graphcool](https://www.graph.cool): Flexible backend platform combining GraphQL + AWS Lambda

For more information on how to get started refer to the [full ios-apollo-instagram tutorial](https://www.graph.cool/docs/quickstart/ios-apollo-instagram/).


## Example

![](http://imgur.com/Tp65mEc.gif)

## Quickstart

### 1. Clone example repository

```sh
git clone https://github.com/graphcool-examples/ios-graphql.git
cd ios-graphql/quickstart-with-apollo
```

### 2. Create GraphQL API with [`graphcool`](https://www.npmjs.com/package/graphcool)


#### 2.1. Create Graphcool project

```sh
# Install Graphcool CLI
npm install -g graphcool

# Create a new "blank" project inside a directory called "graphcool"
graphcool init graphcool --template blank
```

This creates a new project inside your Graphcool account as well as the local project structure inside the `graphcool` directory:

```
.
└── graphcool
    ├── code
    │   ├── hello.graphql
    │   └── hello.js
    ├── graphcool.yml
    └── types.graphql
```

Read the documentation to learn more about the file structure and [project configuration](https://www.graph.cool/docs/reference/basics/project-configuration-t%28yaml%29-opheidaix3).

#### 2.2. Configure data model

Open `./graphcool/types.graphql` and add the following type definition to it:

```graphql
type Post {
  id: ID! @isUnique
  createdAt: DateTime!
  updatedAt: DateTime!
  description: String!
  imageUrl: String!
}
```

Now apply the changes you just made locally to the remote project in your Graphcool account:

```sh
cd graphcool
graphcool deploy
```

The `Post` type is now added to your data model and the corresponding CRUD operations are generated.



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
