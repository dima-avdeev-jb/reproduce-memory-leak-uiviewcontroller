import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.onClick
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.launch
import platform.UIKit.UIWindow

fun makeView(createMapView: () -> UIView, pop: () -> Unit) =
   makeLeakingView(createMapView, pop)

@OptIn(ExperimentalForeignApi::class, ExperimentalFoundationApi::class)
fun makeLeakingView(
   createMapView: () -> UIView,
   pop: () -> Unit
) = ComposeUIViewController {
   Box(Modifier.fillMaxSize().background(Color.Blue).onClick {
      pop()
   }) {
      UIKitView({ createMapView() }, Modifier.size(1.dp))
   }
}
