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


### 2. Create Graphcool service with the [Graphcool CLI](https://docs-next.graph.cool/reference/graphcool-cli/overview-zboghez5go)

```sh
# Install Graphcool Framework CLI
npm install -g graphcool@next

# Create a new service inside a directory called `server`
graphcool init server
```

This created the following file structure in the current directory:

```
.
└── server
    ├── graphcool.yml
    ├── types.graphql
    ├── .graphcoolrc
    └── src
        ├── hello.graphql
        └── hello.js
```

### 3. Define data model

Next, you need to define your data model inside the newly created `types.graphql`-file.

Replace the current contents in `types.graphql` with the following type definition (you can delete the predefined `User` type):

```graphql
type Post @model {
  # Required system field
  id: ID! @isUnique # read-only (managed by Graphcool)

  # Optional system fields (remove if not needed)
  createdAt: DateTime! # read-only (managed by Graphcool)
  updatedAt: DateTime! # read-only (managed by Graphcool)

  description: String!
  imageUrl: String!
}
```

### 4. Deploy the GraphQL server

You're now ready to put your Graphcool service into production! Navigate into the `server` directory and [deploy](https://docs-next.graph.cool/reference/graphcool-cli/commands-aiteerae6l#graphcool-deploy) the service:

```sh
cd server
graphcool deploy
```

Save the HTTP endpoint for the `Simple API` from the output, you'll need it in the next step.

> **Note**: You can now test your GraphQL API inside a GraphQL playground. Simply type the `graphcool playground` command and start sending queries and mutations.


### 5. Connect the app with your GraphQL API

Paste the `Simple API` endpoint into `AppDelegate.swift`  to instantiate the `ApolloClient`:

```js
// replace `__SIMPLE_API_ENDPOINT__` with the endpoint from the previous step
let apollo = ApolloClient(url: URL(string: "__SIMPLE_API_ENDPOINT__")!)
```

### 6. Install `apollo-codegen`

To use the Apollo iOS Client, you need to install [`apollo-codegen`](https://github.com/apollographql/apollo-codegen), a command line tool that will generate Swift types from your GraphQL queries & mutations at build-time. 

```sh
npm install -g apollo-codegen
```

You can find more info the installation process in the [Apollo docs](http://dev.apollodata.com/ios/installation.html).

### 7. Install dependencies & run locally

```sh
cd ..
carthage update
```

Start the app in Xcode 🚀


## Next steps

* [Documentation](https://docs-next.graph.cool)
* [Advanced GraphQL features](https://www.graph.cool/docs/tutorials/advanced-features-eath7duf7d/)
* [Authentication & Permissions](https://www.graph.cool/docs/reference/authorization/overview-iegoo0heez/)
* [Implementing business logic with serverless functions](https://www.graph.cool/docs/reference/functions/overview-boo6uteemo/)


## Help & Community [![Slack Status](https://slack.graph.cool/badge.svg)](https://slack.graph.cool)

Join our [Slack community](http://slack.graph.cool/) if you run into issues or have questions. We love talking to you!

![](http://i.imgur.com/5RHR6Ku.png)
