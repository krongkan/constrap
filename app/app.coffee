
import React, { Component } from 'react'
import { render } from 'react-dom'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import promiseMiddleware from 'redux-promise-middleware'
import MediaQuery from 'react-responsive'
import { createLogger } from 'redux-logger'
import thunk from 'redux-thunk'
import reducer from './reducers'
import { composeWithDevTools } from 'redux-devtools-extension'
import Main from '/app/containers/Main'
import {navBarSelect, getData} from '/app/actions'
import * as _ from 'lodash'

export default class App extends Component
  
  middleware = applyMiddleware(promiseMiddleware(), thunk, createLogger())
  store = createStore(reducer, {},composeWithDevTools(middleware))

  store.dispatch(navBarSelect(1))
  store.dispatch(getData())
  render: ->
    
    <div>
     
      <MediaQuery minDeviceWidth={200}>
        <Provider store={store}>
          <Main/>
        </Provider>
      </MediaQuery>
      
    </div>




