import React from 'react'

export default class Post extends React.Component {

  static propTypes = {
    post: React.PropTypes.object,
  }

  render () {
    return (
      <div className='pa3 bg-black-05 ma3'>
        <div
          className='w-100'
          style={{
            backgroundImage: `url(${this.props.post.imageUrl})`,
            backgroundSize: 'cover',
            paddingBottom: '100%',
          }}
        />
        <div className='pt3'>
          {this.props.post.description}&nbsp;
          <span className='green f6'>
            Author: {this.props.post.author.auth0UserId ? this.props.post.author.auth0UserId.slice(0, 10) : 'Unknown'}
          </span>
        </div>
      </div>
    )
  }
}
