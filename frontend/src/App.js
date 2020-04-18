import React, {useEffect} from 'react';
import './App.css';
import Dashboard from './components/Dashboard'

function App() {
//   useEffect(() => {
//     fetch("/db").then(res => {
//       res.json().then(data => console.log(data))
//     })
      
//   }, []);

  return (
    <div className="App">
      <Dashboard />
    </div>
  );
}

export default App;
