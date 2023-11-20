import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.flow.receiveAsFlow

val backNavigateChannel = Channel<String>(Channel.CONFLATED)
val backNavigateFlow = backNavigateChannel.receiveAsFlow().wrap()