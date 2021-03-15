import React, { Component } from 'react'

export default class MatchRankingInput extends Component {
  state = {
    matchPlayers: this.props.matchPlayers
  }

  formatInputName = (attribute, i) => `match[match_players_attributes][${i}][${attribute}]`

  add = () => {
    this.setState((state) => ({ matchPlayers: [...state.matchPlayers, { player_id: null }] }))
  }

  remove = (i) => {
    const matchPlayers = [...this.state.matchPlayers]
    matchPlayers.splice(i + 1, 1)
    this.setState({ matchPlayers: matchPlayers})
  }

  render () {
    const { matchPlayers } = this.state
    return (
      <div>
        {matchPlayers.map((matchPlayer, i) => {
          return (
            <div className='flex items-center pv2' key={`match_player_${i}`}>
              <input className='w3' type='number' required={true} name={this.formatInputName('rank', i)} value={i + 1} readOnly={true} />
              <input className='flex-auto' type='number' required={true} name={this.formatInputName('player_id', i)} defaultValue={matchPlayer.player_id} />
              <button type='button' onClick={() => this.remove(i)}>remove</button>
            </div>
          )
        })}

        <button type='button' onClick={this.add}>Add</button>
      </div>
    )
  }
}