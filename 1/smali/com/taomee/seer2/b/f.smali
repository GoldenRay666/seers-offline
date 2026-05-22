.class public Lcom/taomee/seer2/b/f;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/taomee/seer2/b/f;


# instance fields
.field private b:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/b/f;->a:Lcom/taomee/seer2/b/f;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/taomee/seer2/b/f;->b:Landroid/content/Context;

    return-void
.end method

.method public static declared-synchronized a(Landroid/content/Context;)Lcom/taomee/seer2/b/f;
    .locals 2

    const-class v1, Lcom/taomee/seer2/b/f;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/taomee/seer2/b/f;->a:Lcom/taomee/seer2/b/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/b/f;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/b/f;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/taomee/seer2/b/f;->a:Lcom/taomee/seer2/b/f;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/b/f;->a:Lcom/taomee/seer2/b/f;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public a(II)V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/b/f;->b:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/taomee/seer2/b/c/i;->b(Landroid/content/Context;II)V

    return-void
.end method
