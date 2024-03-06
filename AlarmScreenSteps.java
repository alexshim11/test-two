package qa.mobile.autotests.definition.mobile.alarm;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import qa.mobile.autotests.screen.alarm.AccountMenu;
import qa.mobile.autotests.screen.alarm.AlarmScreen;

import static qa.mobile.autotests.hook.mobile.MobileHooks.*;
import static utils.Sleeper.sleep;

public class AlarmScreenSteps {
    private final AlarmScreen alarmScreen;

    public AlarmScreenSteps() {
        this.alarmScreen = new AlarmScreen();
    }

    @Then("I am on the 'Alarm' screen with {string} status{platform}")
    public void iAmOnTheScreen(String homeStatus, Boolean platformCondition) {
        if (platformCondition) {
            softAssertions.get().assertThat(alarmScreen.isDisplayedWithType(homeStatus))
                .as(String.format("%s should be displayed with all required elements", getClass().getDeclaredFields()[0].getName()))
                .isEmpty();

            String alarmTitle =
                MESSAGES.getProperty(String.format("alarm.screen.%s.title", homeStatus.replace(" ", ".")));

            softAssertions.get().assertThat(alarmScreen.getText(AlarmScreen.TITLE).replace("\n", " "))
                .as("Title should have correct text value")
                .isEqualTo(alarmTitle);
        }
    }

    @When("I get and save User Sessions data from UI")
    public void iGetAndSaveUserSession() {
        alarmScreen.getAndSaveUserSession();
    }

    @When("I tap on the 'Order Now' button")
    public void iTapOrderNowButton() {
        alarmScreen.tap(AlarmScreen.ORDER_NOW_BUTTON);
    }

    @When("I tap on the 'Start Installing your System' button")
    public void iTapStartButton() {
        alarmScreen.tap(AlarmScreen.START_INSTALLING_SYSTEM_BUTTON);
    }

    @When("I tap on the 'Complete' button")
    public void iTapCompleteButton() {
        alarmScreen.tap(AlarmScreen.COMPLETE_BUTTON);
    }

    @When("I see that My alarm has {string} status")
    public void iSeeAlarmStatus(String alarmStatus) {
        String titleMessage;
        switch (alarmStatus) {
            case "day enabled": {
                titleMessage = MESSAGES.getProperty("alarm.screen.home.is.setup.alarm.on.day.title");
                break;
            }
            case "night enabled": {
                titleMessage = MESSAGES.getProperty("alarm.screen.home.is.setup.alarm.on.night.title");
                break;
            }
            case "instant enabled": {
                titleMessage = "alarm enabled";
                break;
            }
            default:
                titleMessage = MESSAGES.getProperty("alarm.screen.home.is.setup.alarm.off.title");
                break;
        }
        softAssertions.get().assertThat(alarmScreen.isDisplayedCorrectAlarmStatus(alarmStatus))
            .as("Title should have correct text value")
            .isEmpty();
        if (!alarmStatus.equals("loading")) {
            softAssertions.get().assertThat(alarmScreen.getText(AlarmScreen.ALARM_STATUS).replace("\n", " "))
                .as("Title should have correct text value")
                .contains(titleMessage);
        }
    }

    @When("I (de)activate Alarm")
    public void iTapActivateAlarmButton() {
        isAlarmActive = true;
        if (alarmScreen.isAndroid()) {
            alarmScreen.swipeActionsWithActivateButtonAndroid();
        } else {
            alarmScreen.swipeActionsWithActivateButtonIos();
        }
        if (alarmScreen.isAndroid() && alarmScreen.isElementPresent(AlarmScreen.ALLOW_SYSTEM_POPUP, 4)) {
            alarmScreen.tap(AlarmScreen.ALLOW_SYSTEM_POPUP);
        }
        sleep(2);
    }

    @When("I tap on the 'Night Alarm' tab")
    public void iTapNightAlarmTab() {
        alarmScreen.tap(AlarmScreen.NIGHT_BUTTON);
    }

    @When("I tap on the 'Day Alarm' tab")
    public void iTapDayAlarmTab() {
        alarmScreen.tap(AlarmScreen.DAY_BUTTON);
    }

    @When("I tap on the 'Camera' button")
    public void iTapCameraButton() {
        alarmScreen.tap(AlarmScreen.CAMERA_BUTTON);
    }

    @When("I tap on the 'Three dots' menu")
    public void iTapMenu() {
        alarmScreen.tap(AlarmScreen.THREE_DOTS_MENU);
    }

    @When("I tap on the 'Home' menu")
    public void iTapHomeMenu() {
        alarmScreen.tapHomePickerMenu();
        sleep(2);
    }

    @When("I tap on the 'Account' menu")
    public void iTapAccountMenu() {
        alarmScreen.tap(AccountMenu.ACCOUNT_TAB);
    }

    @When("I tap on the 'Chat' menu")
    public void iTapChatMenu() {
        alarmScreen.tap(AccountMenu.CHAT_TAB);
    }

    @When("I swipe to refresh on the Alarm screen{platform}")
    public void iSwipeToRefresh(Boolean platformCondition) {
        if (platformCondition) {
            // for iOS 15.5 swipe to refresh action isn't working, need to terminate the app
            if (System.getProperty("os.version").equalsIgnoreCase("15.5")) {
                DEVICE_SERVICE.get().terminateAppAndLaunch();
            } else {
                alarmScreen.swipeToRefreshAlarmScreen();
            }

        }
    }

    @Then("I {doOrDont}see 'Continue install subs' button")
    public void iAmInstallSubsButton(Boolean condition) {
        softAssertions.get().assertThat(alarmScreen.isElementPresent(AlarmScreen.CONTINUE_INSTALL_SUBS_BUTTON, 5))
            .as(String.format("Continue install subs displayed status should be equal to %s", condition))
            .isEqualTo(condition);
    }

    @When("I tap on the 'Continue install subs' button")
    public void iTapContinueInstallSubsButton() {
        alarmScreen.tap(AlarmScreen.CONTINUE_INSTALL_SUBS_BUTTON);
    }
}
