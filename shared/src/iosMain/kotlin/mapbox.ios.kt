import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
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
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.launch
import platform.UIKit.UIWindow

@OptIn(ExperimentalForeignApi::class)
fun makeLeakingView(
   createMapView: () -> UIView,
   pop: () -> Unit
) = ComposeUIViewController {
   val mapView = remember { createMapView() }

   val scope = rememberCoroutineScope()

   Column {
      UIKitView(factory = {
         mapView
      }, modifier = Modifier.weight(0.5f))

      IconButton(
         modifier = Modifier.weight(0.5f),
         onClick = pop
      ) {
         Icon(imageVector = Icons.Default.ArrowBack, contentDescription = null)
      }
   }
}

@OptIn(ExperimentalForeignApi::class)
fun makeNonLeakingView(
   createMapView: () -> UIView,
   pop: () -> Unit
) = ComposeUIViewController {
   val mapView = remember { createMapView() }

   val scope = rememberCoroutineScope()

   Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
      UIKitView(factory = {
         mapView
      }, modifier = Modifier.fillMaxSize())

      IconButton(
         onClick = pop
      ) {
         Icon(imageVector = Icons.Default.ArrowBack, contentDescription = null)
      }
   }
}