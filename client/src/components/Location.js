import React from 'react'
import axios from 'axios'
import {
  Grid,
  List,
  Segment,
  Header,
  // Image,
} from 'semantic-ui-react';


class Location extends React.Component {
  state = {locations: []}

  componentDidMount() {
    axios.get('/api/locations')
      .then( res => {
        this.setState({ locations: res.data })
      })
      .catch( err => {
        console.log(err)
      })
  }

  resetLocationState = (id) => {
    const { locations } = this.state
      this.setState({
        locations: locations.filter( l => l.id !== id )
      })
  }

  displayLocations = () => {
    return this.state.locations.map ( location => {
      return(
        <Location key={location.id} location={location} resetTrips={this.resetLocationState} />
      )
    })
  }
  
  render () {
    return(
    <Segment>
      <Header as='h1'>Trip Destinations</Header>
        <Grid>
          <Grid.Row>
          <Grid.Column width={8}>
            <Header as='h2'>Locations</Header>
              <List bulleted>
              { this.displayLocations () }
              </List>
          </Grid.Column>
          </Grid.Row>
        </Grid>
    </Segment>
    )
  }
}

export default Location