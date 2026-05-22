.class Lcom/tendcloud/tenddata/game/k$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tendcloud/tenddata/game/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Landroid/content/Context;)J
    .locals 2

    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/game/k;->b:Landroid/content/pm/PackageInfo;

    iget-wide v0, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-wide v0

    :catch_0
    move-exception v0

    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method static b(Landroid/content/Context;)J
    .locals 2

    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/game/k;->b:Landroid/content/pm/PackageInfo;

    iget-wide v0, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-wide v0

    :catch_0
    move-exception v0

    const-wide/16 v0, -0x1

    goto :goto_0
.end method
