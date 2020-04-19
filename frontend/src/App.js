import React from 'react';
import {BrowserRouter} from "react-router-dom";
import 'typeface-roboto';
import './App.css';

import Dashboard from './components/Dashboard'

import Home from './components/Home'


function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Home />
      </BrowserRouter>
    </div>
  );
}

export default App;
