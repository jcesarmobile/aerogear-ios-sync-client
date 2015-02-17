import UIKit
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

import XCTest
import AeroGearSyncClient
import AeroGearSync

/*
class SyncClientTests: XCTestCase {
    
    typealias T = JsonConverter.Json
    var dataStore: InMemoryDataStore<T>!
    var synchonizer: JsonDiffMatchPatchSynchronizer!
    var engine: ClientSyncEngine<JsonDiffMatchPatchSynchronizer, InMemoryDataStore<T>>!

    class StringContentSerializer : ContentSerializer {
        func asString(content: String) -> String {
            return content
        }
    }
    class JsonContentSerializer : ContentSerializer {
        func asString(content: T) -> String {
            return JsonConverter.asJsonString(content)!
        }
    }
    let stringContentSerializer = StringContentSerializer()
    let jsonContentSerializer = JsonContentSerializer()

    override func setUp() {
        super.setUp()
        self.dataStore = InMemoryDataStore()
        self.synchonizer = JsonDiffMatchPatchSynchronizer()
        self.engine = ClientSyncEngine(synchronizer: synchonizer, dataStore: dataStore)
    }
    // TODO AGIOS-344 move integration test separate target
/*
    func testAddDocument() {
        let syncClient = SyncClient(url: "http://localhost:7777/sync", syncEngine: engine, contentSerializer: jsonContentSerializer)
        let id = NSUUID().UUIDString
        let content = ["name": "Fletch"]
        let callback = {(doc: ClientDocument<T>) -> () in }
        syncClient.connect().addDocument(ClientDocument<T>(id: id, clientId: "iosClient", content: content), callback)
        sleep(3)
        let added = dataStore.getClientDocument(id, clientId: "iosClient")
        XCTAssertEqual(id, added!.id)
        XCTAssertEqual("iosClient", added!.clientId)
        XCTAssertEqual(content["name"]! as String, added!.content["name"] as String)
        syncClient.disconnect()
    }
    
    func testDiffAndSync() {
        let expectation = expectationWithDescription("Callback should be invoked. Is the Sync Server running?")
        let id = NSUUID().UUIDString

        let content = ["name": "Fletch"]
        let update = ["name": "Fletch2"]
        let syncClient = SyncClient(url: "http://localhost:7777/sync", syncEngine: engine, contentSerializer: jsonContentSerializer)
        let callback = {(doc: ClientDocument<T>) -> () in
            println("Testing callback: received: \(doc.content)")
            XCTAssertEqual(doc.content["name"]! as String, "Fletch2")
            expectation.fulfill()
        }
        syncClient.connect().addDocument(ClientDocument<T>(id: id, clientId: "iosClient", content: content), callback)
        syncClient.diffAndSend(ClientDocument<T>(id: id, clientId: "iosClient", content: update))
        waitForExpectationsWithTimeout(3.0, handler:nil)
        syncClient.disconnect()
    }
*/
}
*/
