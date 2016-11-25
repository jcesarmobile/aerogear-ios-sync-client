/*
* JBoss, Home of Professional Open Source.
* Copyright Red Hat, Inc., and individual contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation
import AeroGearSyncJsonPatch
import Starscream

/**
A Differential Synchronization client that uses the WebSocket as the transport protocol. SyncClient implement
WebSocketDelegate protocol; it provides all delegate method implementations.
<br/><br/>
The ClientSynchronizer generic type is the type that this implementation can handle. it could be either JsonPatchSynchronizer or diffMatchPatchSynchronizer.
The DataStore generic type is the type that this implementation can handle. For now, we have InMemoryDataStore only.
The ClientSynchronizer and DataStore should have compatible document type.
*/
open class SyncClient<CS:ClientSynchronizer, D:DataStore> : WebSocketDelegate where CS.T == D.T, CS.D == D.D, CS.P.E == CS.D {
    
    typealias T = CS.T
    
    /**
    Websocket object initialized as part of default SyncClient initialization.
    */
    var ws: WebSocket!
    
    /**
    Document we want to perform data sync upon.
    */
    var documents = Dictionary<String, ClientDocument<T>>()
    
    /**
    SyncEngine determines the type of Synchronizer and Document the sync relates to.
    */
    let syncEngine: ClientSyncEngine<CS, D>
    
    /**
    Initializes a SyncClient.
    
    :param: url the URL of the sync server.
    :param: syncEngine the ClientSyncEngine to be used by this SyncClient.
    :param: contentSerializer a concrete ContentSerializer that allows for control of serializing the document content.
    */
    public convenience init(url: String, syncEngine: ClientSyncEngine<CS, D>) {
        self.init(url: url, optionalProtocols: Optional.none, syncEngine: syncEngine)
    }
    
    /**
    Initializes a SyncClient.
    
    :param: url the URL of the sync server
    :param: protocols optional WebSocket protocols that the underlying WebSocket should use.
    :param: syncEngine the ClientSyncEngine to be used by this SyncClient.
    :param: contentSerializer a concrete ContentSerializer that allows for control of serializing the document content.
    */
    public convenience init(url: String, protocols: Array<String>, syncEngine: ClientSyncEngine<CS, D>) {
        self.init(url: url, optionalProtocols: protocols, syncEngine: syncEngine)
    }
    
    fileprivate init(url: String, optionalProtocols: Array<String>?, syncEngine: ClientSyncEngine<CS, D>) {
        self.syncEngine = syncEngine
        
        if let protocols = optionalProtocols {
            ws = WebSocket(url: NSURL(string: url)! as URL, protocols: protocols)
        } else {
            ws = WebSocket(url: NSURL(string: url)! as URL)
        }
        ws.delegate = self
    }
    
    /**
    Connects this SyncClient to the SyncServer. The call is delegated to WebSocket's connect.
    
    :returns: self to support method chaining.
    */
    open func connect() -> Self {
        ws.connect()
        return self
    }
    
    /**
    Adds a document to this SyncClient.
    
    :param: doc the ClientDocument to add to this SyncClient.
    :param: callback the callback that will be invoked with updates from the server.
    */
    open func addDocument(doc: ClientDocument<T>, callback: @escaping (ClientDocument<T>) -> ()) {
        syncEngine.add(clientDocument: doc, callback: callback)
        ws.write(string: syncEngine.documentToJson(clientDocument: doc))
    }
    
    /**
    Computes a diff of the passed in document with the version in this SyncClient and
    sends the resulting PatchMessage to the server.
    
    :param: doc the ClientDocument with updates to be diffed.
    :returns: self to support method chaining.
    */
    open func diffAndSend(_ doc: ClientDocument<T>) -> Self {
        if let patchMessage = syncEngine.diff(clientDocument: doc) {
            ws.write(string:patchMessage.asJson())
        }
        return self
    }
    
    /**
    Disconnects this SyncClient from the server.
    */
    open func disconnect() {
        ws.disconnect()
    }
    
    /**
    Delegated method from WebSocketDelegate which happens when a message is received.
    
    :param: text string representation of the message received.
    */
    open func websocketDidReceiveMessage(socket ws: WebSocket, text: String) {
        if let patchMessage = syncEngine.patchMessageFromJson(json: text) {
            syncEngine.patch(patchMessage: patchMessage)
        } else {
            print("Received none patchMessage: \(text)")
        }
    }
    
    /**
    Delegated method from WebSocketDelegate which happens when the connect was successful.
    */
    open func websocketDidConnect(socket ws: WebSocket) {
        print("Websocket is connected")
    }
    
    /**
    Delegated method from WebSocketDelegate which happens when a disconnect occurs.
    */
    open func websocketDidDisconnect(socket ws: WebSocket, error: NSError?) {
        if let _ = error {
            print("Websocket is disconnected with error: \(error!.localizedDescription)")
        } else {
            print("Websocket is disconnected")
        }
    }
    
    /**
    Delegated method from WebSocketDelegate which happens when an error occurs.
    
    :param: error contains the details of the error.
    */
    open func websocketDidWriteError(_ ws: WebSocket, error: NSError?) {
        print("Error from the Websocket: \(error!.localizedDescription)")
    }
    
    /**
    Delegated method from WebSocketDelegate which happens when a data are received.
    
    :param: data binary representation of the data received.
    */
    open func websocketDidReceiveData(socket ws: WebSocket, data: Data) {
        print("Message: \(data)")
    }
    
}
