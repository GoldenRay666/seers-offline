.class public Lcom/taomee/pwdlogin/data/PreferencesData;
.super Ljava/lang/Object;
.source "PreferencesData.java"


# instance fields
.field private editor:Landroid/content/SharedPreferences$Editor;

.field private sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "loginFile"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 11
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->editor:Landroid/content/SharedPreferences$Editor;

    .line 12
    return-void
.end method


# virtual methods
.method public addDeviceId(Ljava/lang/String;)V
    .locals 2
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "deviceId"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 16
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 17
    return-void
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 20
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/PreferencesData;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "deviceId"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
