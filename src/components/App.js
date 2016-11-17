import React from 'react'
import LoginAuth0 from './LoginAuth0'
import { graphql } from 'react-apollo'
import { withRouter } from 'react-router'
import gql from 'graphql-tag'
import ListPage from './ListPage'
import NewPostLink from './NewPostLink'

const clientId = '__AUTH0_CLIENT_ID__'
const domain='__AUTH0_DOMAIN__'

class App extends React.Component {
  static propTypes = {
    router: React.PropTypes.object.isRequired,
    createUser: React.PropTypes.func.isRequired,
  }

  _onLoginAuth0 = (auth0IdToken) => {
    window.localStorage.setItem('auth0IdToken', auth0IdToken)
    this.props.router.replace(`/login`)
  }

  _logout = () => {
    // remove token from local storage and reload page to reset apollo client
    window.localStorage.removeItem('auth0IdToken')
    location.reload()
  }

  _isLoggedIn = () => {
    return window.localStorage.getItem('auth0IdToken') !== null
  }

  render () {
    if (this._isLoggedIn()) {
      console.log('render logged in')
      return this.renderLoggedIn()
    } else {
      console.log('render logged out')
      return this.renderLoggedOut()
    }
  }

  renderLoggedIn() {
    return (
      <div>
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
        <div className='pv3'>
          <LoginAuth0
            clientId={clientId}
            domain={domain}
            onLogin={this._onLoginAuth0}
          />
        </div>
        <span>Log in to create new posts</span>
        <ListPage />
      </div>
    )
  }
}

const createUserMutation = gql`
mutation($idToken: String!, $emailSubscription: Boolean!) {
  createUser(authProvider: {auth0: {idToken: $idToken}}, emailSubscription: $emailSubscription) {
    auth0UserId
  }
}
`

export default graphql(createUserMutation, {name : 'createUser'})(withRouter(App)
)
