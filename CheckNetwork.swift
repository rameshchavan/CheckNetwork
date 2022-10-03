 
import Network

class CheckNetwork {
    
    /*
     Apple’s Network framework provides a number of useful classes for working with network data, including one specifically designed to monitor network accessibility: NWPathMonitor. If you ever used Apple’s older Reachability system, NWPathMonitor replaces it fully.
     
     NWPath has a few properties, but there are two in particular you’re likely to care about: status describes whether the connection is currently available or not, and isExpensive is set to true when using cellular data or when using WiFi that is hotspot routed through an iPhone’s cellular connection.
     
     You can also use .wifi or even wiredEthernet if you want. Omitting the interface type causes them all to be watched at the same time, which is probably what you’ll want most of the time.
     */
  
    
    let monitor = NWPathMonitor()
    
    init(){
        monitor.pathUpdateHandler = { path in
            
            if path.status == .satisfied {
                print("We're Connected");
            }else{
                print("No Connection.")
            }
            
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue);
        
    }
    
    
    
    @objc func closeNwConCheck(){
        
    
        monitor.cancel();
        print("closeNwConCheck")
        
    }
    
}

let nw = CheckNetwork();

