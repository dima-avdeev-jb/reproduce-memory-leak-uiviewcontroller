import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.ui.interop.UIKitView
import androidx.compose.ui.window.ComposeUIViewController
import kotlinx.cinterop.ExperimentalForeignApi
import platform.UIKit.UIView
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.launch
import platform.UIKit.UIWindow

@OptIn(ExperimentalForeignApi::class)
fun createMapboxVC(
   createMapView: () -> UIView
) = ComposeUIViewController {
   val mapView = remember { createMapView() }
   // perhaps solution   is to remember below
   //val myOnBack = remember { onBack }
   val scope = rememberCoroutineScope()
   Column {
      TopAppBar(
         modifier = Modifier.padding(top = 50.dp),
         title = { Text("Title") },
         navigationIcon = {
            IconButton(
               onClick = { scope.launch { backNavigateChannel.send("") } }
            ) {
               Icon(imageVector = Icons.Default.ArrowBack, contentDescription = null)
            }
         },
      )
      UIKitView(factory = {
         mapView
      }, modifier = Modifier.fillMaxSize())
   }
}