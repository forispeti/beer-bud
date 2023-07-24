var huPlayer = "O"
var aiPlayer = "X"

var origBoard = [0, 1, 2, 3, 4, 5, 6, 7, 8]

function minimax(newBoard, player) {

    //available spots
    var availSpots = emptyIndexies(newBoard)

    // checks for the terminal states such as win, lose, and tie and returning a value accordingly
    if (winning(newBoard, huPlayer)) {
        return {
            "score": -10
        }
    } else if (winning(newBoard, aiPlayer)) {
        return {
            "score": 10
        }
    } else if (availSpots.length === 0) {
        return {
            "score": 0
        }
    }

    // an array to collect all the objects
    var moves = []

    for (var i = 0; i < availSpots.length; i++) {
        var move = {}
        move.index = newBoard[availSpots[i]]

        newBoard[availSpots[i]] = player

        var result
        if (player === aiPlayer) {
            result = minimax(newBoard, huPlayer)
            move.score = result.score
        } else {
            result = minimax(newBoard, aiPlayer)
            move.score = result.score
        }

        //reset the spot to empty
        newBoard[availSpots[i]] = move.index

        // push the object to the array
        moves.push(move)
    }

    // if it is the computer's turn loop over the moves and choose the move with the highest score
    var bestMove
    var bestScore
    if (player === aiPlayer) {
        bestScore = -10000
        for (var i = 0; i < moves.length; i++) {
            if (moves[i].score > bestScore) {
                bestScore = moves[i].score
                bestMove = i
            }
        }
    } else {

        // else loop over the moves and choose the move with the lowest score
        bestScore = 10000
        for (var i = 0; i < moves.length; i++) {
            if (moves[i].score < bestScore) {
                bestScore = moves[i].score
                bestMove = i
            }
        }
    }
    // return the chosen move (object) from the array to the higher depth
    return moves[bestMove]
}

// returns the available spots on the board
function emptyIndexies(board) {
    return board.filter(s => s !== "O" && s !== "X")
}

function winning(board, player) {
    if ((board[0] === player && board[1] === player && board[2]
         === player) || (board[3] === player && board[4]
                         === player && board[5] === player) || (board[6] === player && board[7] === player && board[8] === player) || (board[0] === player && board[3] === player && board[6] === player) || (board[1] === player && board[4] === player && board[7] === player) || (board[2] === player && board[5] === player && board[8] === player) || (board[0] === player && board[4] === player && board[8] === player) || (board[2] === player && board[4] === player && board[6] === player)) {
        return true
    } else {
        return false
    }
}
