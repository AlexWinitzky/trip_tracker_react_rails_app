import React from 'react'
import axios from 'axios'
import { Link} from 'react-router-dom';
import {
  Grid,
  List,
  Segment,
  Header,
  // Image,
} from 'semantic-ui-react';


class Trip extends React.Component {
  state = {trips: []}

  componentDidMount() {
    axios.get('/api/trips')
      .then( res => {
        this.setState({ trips: res.data })
      })
      .catch( err => {
        console.log(err)
      })
  }

  // resetTripState = (id) => {
  //   const { trips } = this.state
  //     this.setState({
  //       trips: trips.filter( t => t.id !== id )
  //     })
  // }

  displayTrips = () => {
    return this.state.trips.map ( trip => {
      return(
        <Link to={`/trips/${trip.id}`}>{trip.name}</Link>
      )
    })
  }
  
  render () {
    return(
    <Segment basic>
      <Header as='h1'>Trip Tracker</Header>
        <Grid>
          <Grid.Row>
          <Grid.Column width={8}>
            <Header as='h2'>Trips</Header>
              <List bulleted>
              { this.displayTrips () }
              </List>
          </Grid.Column>
          </Grid.Row>
        </Grid>
    </Segment>
    )
  }
}

export default Trip