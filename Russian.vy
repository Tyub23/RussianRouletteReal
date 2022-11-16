players: public (DynArray[address,100])
losers: public (DynArray [address,100])
odds: public (uint256)
playersTurn: public (uint256)
creator: address

@external
def __init__(): 
    self.creator = msg.sender
    self.playersTurn = 0
@external
def setOdds(oneInThisMany: uint256):
    self.odds = oneInThisMany
@external
def addPlayer(player: address):
    if player not in self.players and player not in self.losers:
        self.players.append(player)
@internal
def lose(player: address):
    self.players = []
    self.losers.append(player)
@internal
def random() -> uint256:
    return self.odds-1
@external
def play():
    rand:uint256=self.random()
    nexta:address=self.players[self.playersTurn]
    if rand==1:
        self.lose(nexta)
    else:
        self.playersTurn+=1
@external
def isALoser(person:address) -> bool:
    return person in self.losers
