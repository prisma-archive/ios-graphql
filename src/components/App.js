import React from 'react'
import LoginAuth0 from './LoginAuth0'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import ListPage from './ListPage'
import NewPostLink from './NewPostLink'

const clientId = '__AUTH0_CLIENT_ID__'
const domain='__AUTH0_DOMAIN__'

class App extends React.Component {
  static propTypes = {
    data: React.PropTypes.object,
    createUser: React.PropTypes.func,
    signinUser: React.PropTypes.func,
  }

  state = {
    auth0IdToken: window.localStorage.getItem('auth0IdToken'),
    graphcoolToken: window.localStorage.getItem('graphcoolToken'),
  }

  _onLoginAuth0 = (auth0IdToken) => {
    console.log('hi')
    const variables = { idToken: auth0IdToken }
    window.localStorage.setItem('auth0IdToken', auth0IdToken)
    this.setState({ auth0IdToken })

    this.props.createUser({ variables })
      .then(({ data }) => {
        console.log('got create', data)

        this.props.signinUser({ variables })
          .then(({ data }) => {
            console.log('got signin', data)
            window.localStorage.setItem('graphcoolToken', data.token)
            this.setState({ graphcoolToken: data.token })
          })
      })
  }

  _logout = () => {
    this.setState({
      auth0IdToken: null,
      graphcoolToken: null,
    })
    window.localStorage.removeItem('auth0IdToken')
    window.localStorage.removeItem('graphcoolToken')

    // reload page so apollo client store is reset
    location.reload()
  }

  render () {
    if (this.state.auth0IdToken) {
      return this.renderLoggedIn()
    } else {
      return this.renderLoggedOut()
    }
  }

  renderLoggedIn() {
    return (
      <div>
        <span>Currently logged in: {this.state.auth0IdToken.slice(0,10)}</span>
        <div className='pv3'>
          <span
            className='dib bg-red white pa3 pointer dim'
            onClick={this._logout}
          >
            Logout
          </span>
        </div>
        <ListPage />
        <NewPostLink />
      </div>
    )
  }

  renderLoggedOut() {
    return (
      <div>
        <span>Sign in to create a new post</span>
        <div className='pv3'>
          <LoginAuth0
            clientId={clientId}
            domain={domain}
            onLogin={this._onLoginAuth0}
          />
        </div>
        <ListPage />
      </div>
    )
  }
}

const createUserMutation = gql`
mutation($idToken: String!) {
  createUser(authProvider: {auth0: {idToken: $idToken}}) {
    auth0UserId
  }
}
`

const signinUserMutation = gql`
mutation($idToken: String) {
  signinUser(auth0: {idToken: $idToken}) {
    token
  }
}
`

export default graphql(createUserMutation, {name : 'createUser'})(
  graphql(signinUserMutation, {name: 'signinUser'})(App)
)