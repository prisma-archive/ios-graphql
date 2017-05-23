//  This file was automatically generated and should not be edited.

import Apollo

public final class CreatePostMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation CreatePost($description: String!, $imageUrl: String!) {" +
    "  createPost(description: $description, imageUrl: $imageUrl) {" +
    "    __typename" +
    "    ...PostDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PostDetails.fragmentDefinition)

  public let description: String
  public let imageUrl: String

  public init(description: String, imageUrl: String) {
    self.description = description
    self.imageUrl = imageUrl
  }

  public var variables: GraphQLMap? {
    return ["description": description, "imageUrl": imageUrl]
  }

  public struct Data: GraphQLMappable {
    public let createPost: CreatePost?

    public init(reader: GraphQLResultReader) throws {
      createPost = try reader.optionalValue(for: Field(responseName: "createPost", arguments: ["description": reader.variables["description"], "imageUrl": reader.variables["imageUrl"]]))
    }

    public struct CreatePost: GraphQLMappable {
      public let __typename: String

      public let fragments: Fragments

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))

        let postDetails = try PostDetails(reader: reader)
        fragments = Fragments(postDetails: postDetails)
      }

      public struct Fragments {
        public let postDetails: PostDetails
      }
    }
  }
}

public final class AllPostsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllPosts {" +
    "  allPosts {" +
    "    __typename" +
    "    ...PostDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PostDetails.fragmentDefinition)
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let allPosts: [AllPost]

    public init(reader: GraphQLResultReader) throws {
      allPosts = try reader.list(for: Field(responseName: "allPosts"))
    }

    public struct AllPost: GraphQLMappable {
      public let __typename: String

      public let fragments: Fragments

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))

        let postDetails = try PostDetails(reader: reader)
        fragments = Fragments(postDetails: postDetails)
      }

      public struct Fragments {
        public let postDetails: PostDetails
      }
    }
  }
}

public struct PostDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment PostDetails on Post {" +
    "  __typename" +
    "  id" +
    "  imageUrl" +
    "  description" +
    "}"

  public static let possibleTypes = ["Post"]

  public let __typename: String
  public let id: GraphQLID
  public let imageUrl: String
  public let description: String

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    id = try reader.value(for: Field(responseName: "id"))
    imageUrl = try reader.value(for: Field(responseName: "imageUrl"))
    description = try reader.value(for: Field(responseName: "description"))
  }
}