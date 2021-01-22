import React from 'react'
import { Route, Switch } from 'react-router-dom'
import Welcome from './Welcome/Welcome'
import Forecast from './Forecast/Forecast'

const App = () => {
  return<Switch>
    <Route exact path="/" component={Welcome}/>
    <Route exact path="/forecast/:zipcode" component={Forecast}/>

  </Switch>
}

export default App
