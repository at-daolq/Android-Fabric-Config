package vn.asiantech.fabric;

import android.app.Application;

import com.crashlytics.android.Crashlytics;

import io.fabric.sdk.android.Fabric;

/**
 * App.
 *
 * @author DaoLQ
 */
public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // Fabric init crashlytics
        Fabric.with(this, new Crashlytics());
    }
}
