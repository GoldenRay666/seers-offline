.class public Lcom/taomee/util/VersionUtil;
.super Ljava/lang/Object;
.source "VersionUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getVersionName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 11
    sget-object v2, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v2}, Lcom/taomee/seer2/seer2;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 12
    .local v0, "manager":Landroid/content/pm/PackageManager;
    const-string v1, ""

    .line 14
    .local v1, "versionName":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v2}, Lcom/taomee/seer2/seer2;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v1, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    :goto_0
    return-object v1

    .line 15
    :catch_0
    move-exception v2

    goto :goto_0
.end method
