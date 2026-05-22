.class public Lcom/taomee/seer2/o/Eyjk;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static a:Lcom/taomee/seer2/o/Eyjk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/o/Eyjk;->a:Lcom/taomee/seer2/o/Eyjk;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a()Lcom/taomee/seer2/o/Eyjk;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/o/Eyjk;->a:Lcom/taomee/seer2/o/Eyjk;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/o/Eyjk;

    invoke-direct {v0}, Lcom/taomee/seer2/o/Eyjk;-><init>()V

    sput-object v0, Lcom/taomee/seer2/o/Eyjk;->a:Lcom/taomee/seer2/o/Eyjk;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/o/Eyjk;->a:Lcom/taomee/seer2/o/Eyjk;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/taomee/seer2/o/e;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
