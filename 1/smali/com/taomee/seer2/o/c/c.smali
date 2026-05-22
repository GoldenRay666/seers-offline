.class public Lcom/taomee/seer2/o/c/c;
.super Ljava/lang/Object;


# static fields
.field public static a:Z

.field private static b:Lcom/taomee/seer2/o/c/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/o/c/c;->b:Lcom/taomee/seer2/o/c/c;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/taomee/seer2/o/c/c;->a:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Lcom/taomee/seer2/o/c/c;
    .locals 2

    const-class v1, Lcom/taomee/seer2/o/c/c;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/taomee/seer2/o/c/c;->b:Lcom/taomee/seer2/o/c/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/o/c/c;

    invoke-direct {v0}, Lcom/taomee/seer2/o/c/c;-><init>()V

    sput-object v0, Lcom/taomee/seer2/o/c/c;->b:Lcom/taomee/seer2/o/c/c;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/taomee/seer2/o/c/c;->b:Lcom/taomee/seer2/o/c/c;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/taomee/seer2/o/c/d;

    invoke-direct {v1, p0, p1}, Lcom/taomee/seer2/o/c/d;-><init>(Lcom/taomee/seer2/o/c/c;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public b()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/taomee/seer2/o/c/e;

    invoke-direct {v1, p0}, Lcom/taomee/seer2/o/c/e;-><init>(Lcom/taomee/seer2/o/c/c;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public b(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/taomee/seer2/o/c/f;

    invoke-direct {v1, p0, p1}, Lcom/taomee/seer2/o/c/f;-><init>(Lcom/taomee/seer2/o/c/c;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
